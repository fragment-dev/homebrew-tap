require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5305.0.0-darwin-x64.tar.gz"
    sha256 "35db4a5c4765bc0cf41ff2041442cb435e38d80e91f6d0aee33d6603d6ad3e20"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5305.0.0-darwin-arm64.tar.gz"
      sha256 "55f57b5043291efcf476c3c82053ddbed1f12d0478220ef18e4b839367b3915d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5305.0.0-linux-x64.tar.gz"
    sha256 "a2b040de83c919a6cf5246566dfa9e9ca3c54342f898c749e18e1abd27a2adb0"
  end
  version "5305.0.0"
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
