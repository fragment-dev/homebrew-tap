require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2886.0.0-darwin-x64.tar.gz"
    sha256 "0d4051935e0be5bfad23e956734a7f0e9732d9b6f2711f12a6c256f9da774eb1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2886.0.0-darwin-arm64.tar.gz"
      sha256 "9ef7e6251b0b8999c9b160e71f11180fdee53f29ecabacf7c2a97e6d1307eb58"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2886.0.0-linux-x64.tar.gz"
    sha256 "19c4ceab94e00a2f384b93e888b9f5ab960dfbdf1e39bcc2ae24148f3651224a"
  end
  version "2886.0.0"
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
