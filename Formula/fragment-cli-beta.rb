require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3571.0.0-darwin-x64.tar.gz"
    sha256 "5c43e183818006c9a7ef510402361aee7d00378db06e5538ac5911f8216e3dc7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3571.0.0-darwin-arm64.tar.gz"
      sha256 "4c41eef8a80df318d1bf3e06bf20ac5e9472e27838d92fb9320a8699f3bf74ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3571.0.0-linux-x64.tar.gz"
    sha256 "561799fd19ee37cd2fc37af8546996c21ea945079b2910bf7446a622d8c18038"
  end
  version "3571.0.0"
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
