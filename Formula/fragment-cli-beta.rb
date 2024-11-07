require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5745.0.0-darwin-x64.tar.gz"
    sha256 "2716cd409cf346aa0349651d53c2fbc2be6915f68d45dd384f2246e6c1ef946d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5745.0.0-darwin-arm64.tar.gz"
      sha256 "a9b1fa3d7cde7b988614db6289894c18c814cbf0e3efd554d7004507b504d19c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5745.0.0-linux-x64.tar.gz"
    sha256 "0d4886a110f7afeebaecc221b4caeeddf9e84dcca449812ee7ee850e388849b9"
  end
  version "5745.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
