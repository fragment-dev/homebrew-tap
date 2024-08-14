require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5508.0.0-darwin-x64.tar.gz"
    sha256 "950a6f656d7b3fedd3ef97b024e6048a6ee646e69e657c14a7e102d480f7d3b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5508.0.0-darwin-arm64.tar.gz"
      sha256 "d43d0c4fff8b578edfbcc29953163d1b086ca365076b3b7e934188f4495b30fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5508.0.0-linux-x64.tar.gz"
    sha256 "8d683b89230d4a175ad53ebbe533340e6931d4642b930e1241801b25f89a7ead"
  end
  version "5508.0.0"
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
