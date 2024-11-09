part of 'file_details_imports.dart';

class FileDetails extends StatelessWidget {
  const FileDetails({super.key, required this.repoData, required this.index});
  final RepoModel repoData;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Check if the index is valid before accessing the file
    if (repoData.files == null || repoData.files!.isEmpty || index < 0 || index >= repoData.files!.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text("File Details"),
        ),
        body: Center(
          child: Text("No file Created Yet by Owner..."),
        ),
      );
    }

    // Get the file details using the index
    FileValue file = repoData.files!.values.elementAt(index);

    return Scaffold(
      appBar: AppBar(
        title: Text("File Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Filename: ${file.filename}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Type: ${file.type}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Language: ${file.language}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Raw URL: ${file.rawUrl}",
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              "Size: ${file.size} bytes",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
