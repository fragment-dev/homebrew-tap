require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3177.0.0-darwin-x64.tar.gz"
    sha256 "e6aeed62aeac92011ad20473249a1eb369616fbcc809c163251d137adcfb4bf4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3177.0.0-darwin-arm64.tar.gz"
      sha256 "3daa839657c0c71eef136324cb7ee9d24ef6ac34b18fed8acab1abe4766534f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3177.0.0-linux-x64.tar.gz"
    sha256 "7e0c70470481d2ca477197860ab489af7464156c56caa2872cd2628516599bd4"
  end
  version "3177.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
