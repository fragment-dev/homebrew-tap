require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3342.0.0-darwin-x64.tar.gz"
    sha256 "09c7cbbdbe5b260252301f8e239a1544ff07a086e28717f1521f52a113f1538e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3342.0.0-darwin-arm64.tar.gz"
      sha256 "2b4a708e85012b2f2d32f9ca5b3f24e7285651543501134e1bdad2c538528d65"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3342.0.0-linux-x64.tar.gz"
    sha256 "0e8d95c6b062ecca37391afd2cdc5593273f70684c211f2ea4ba690ede80b4cb"
  end
  version "3342.0.0"
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
