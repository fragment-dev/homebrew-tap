require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3489.0.0-darwin-x64.tar.gz"
    sha256 "1c72e80ae4e0979974da0022a885923b7f28f34fdd22e9d23ed94669aaa563c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3489.0.0-darwin-arm64.tar.gz"
      sha256 "e5a3341a8f6e45d9611c002476a7fa207a304d1843a5ddc4decee7e02359c127"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3489.0.0-linux-x64.tar.gz"
    sha256 "cacd18e9f955625416438083e61d4530e50de8d9d7e8e7adce40486bc5085706"
  end
  version "3489.0.0"
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
