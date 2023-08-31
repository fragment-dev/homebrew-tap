require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3456.0.0-darwin-x64.tar.gz"
    sha256 "c1d3ca2ff12a23bb97a664abc4eb1627edd67cae20420a1523d33ddfacff3523"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3456.0.0-darwin-arm64.tar.gz"
      sha256 "b49d16d9e0a95706294cd0b8f654bb997665d051b78c6529f037f36f8d0e2ac7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3456.0.0-linux-x64.tar.gz"
    sha256 "ac5a73a22bc153dbb70e4e21bb36d5289f2a278c6dec3b785df1ea9eb7b318cb"
  end
  version "3456.0.0"
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
