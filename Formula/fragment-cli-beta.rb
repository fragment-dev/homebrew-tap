require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4433.0.0-darwin-x64.tar.gz"
    sha256 "854c382b4e89bc177daea679bd934a514601cb89261bcd62063f954be3b7a02b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4433.0.0-darwin-arm64.tar.gz"
      sha256 "08fe2f6930b4c70b44be01cd471a27e9142d73c1e3052305b23ececf7d73430f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4433.0.0-linux-x64.tar.gz"
    sha256 "4a8390cfdbde744e5be65863e09844c90fbc709f0ec3b46e0078a0a491c99932"
  end
  version "4433.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
