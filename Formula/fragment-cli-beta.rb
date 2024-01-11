require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4313.0.0-darwin-x64.tar.gz"
    sha256 "8d829df5df83410a4cf8b247fb628d4b09df0d78c7e886f09ec6a10ff5c6ef3a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4313.0.0-darwin-arm64.tar.gz"
      sha256 "fc88e72f19adda2786e44a36cd0bc347f10a2df0b35d67646fc4e10c7e244b91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4313.0.0-linux-x64.tar.gz"
    sha256 "5f6ad34f92259528a994836c3bf0755d4eab93b66f025342d7eb7dc65318213c"
  end
  version "4313.0.0"
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
