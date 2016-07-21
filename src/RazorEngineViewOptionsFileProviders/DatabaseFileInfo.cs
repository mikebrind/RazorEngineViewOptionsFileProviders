using Microsoft.Extensions.FileProviders;
using System;
using System.Data.SqlClient;
using System.IO;
using System.Text;

namespace RazorEngineViewOptionsFileProviders
{
    public class DatabaseFileInfo : IFileInfo
    {
        private string _viewPath;
        private byte[] _viewContent;
        private DateTimeOffset _lastModified;
        private bool _exists;

        public DatabaseFileInfo(string connection, string viewPath)
        {
            _viewPath = viewPath;
            GetView(connection, viewPath);
        }
        public bool Exists => _exists;

        public bool IsDirectory => false;

        public DateTimeOffset LastModified => _lastModified;

        public long Length
        {
            get
            {
                using (var stream = new MemoryStream(_viewContent))
                {
                    return stream.Length;
                }
            }
        }

        public string Name => Path.GetFileName(_viewPath);

        public string PhysicalPath => null;

        public Stream CreateReadStream()
        {
            return new MemoryStream(_viewContent);
        }

        private void GetView(string connection, string viewPath)
        {
            var query = $@"SELECT Content, LastModified FROM Views WHERE Location = @Path;
                    UPDATE Views SET LastRequested = GetUtcDate() WHERE Location = @Path";
            try
            {
                using (var conn = new SqlConnection(connection))
                using (var cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Path", viewPath);
                    conn.Open();
                    using (var reader = cmd.ExecuteReader())
                    {
                        _exists = reader.HasRows;
                        if (_exists)
                        {
                            reader.Read();
                            _viewContent = Encoding.UTF8.GetBytes(reader["Content"].ToString());
                            _lastModified = Convert.ToDateTime(reader["LastModified"]);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // if something went wrong, Exists will be false
            }
        }
    }
}
