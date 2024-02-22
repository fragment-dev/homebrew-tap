require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4618.0.0-darwin-x64.tar.gz"
    sha256 "174d1dd5914e5158388f20b3496629d713aeb9e8fe8c45fad357448312d1906f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4618.0.0-darwin-arm64.tar.gz"
      sha256 "ea581cf9287ee8f9fa7f1c3c76ff1861fefb77c8fb2e08571f9549005c8ed457"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4618.0.0-linux-x64.tar.gz"
    sha256 "54195509e78176100a94b6044609d97ed8c9855ef747c3605851757ff35fc63d"
  end
  version "4618.0.0"
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
