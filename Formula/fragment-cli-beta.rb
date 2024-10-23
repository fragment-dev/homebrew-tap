require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5694.0.0-darwin-x64.tar.gz"
    sha256 "bef285c5806bfb25a148dc29ab37954e9d404713d1573b9bcc3e13556a96aa38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5694.0.0-darwin-arm64.tar.gz"
      sha256 "898deae78037df8cf2ceb5e155a309425322bfa657713dd46c491b536e39df94"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5694.0.0-linux-x64.tar.gz"
    sha256 "3f6d31d9b00e1a29df2e7d2c6b7a128ee779b348cfc5236d28d73d7b9db6473f"
  end
  version "5694.0.0"
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
