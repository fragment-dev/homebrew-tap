require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2488.0.0-darwin-x64.tar.gz"
    sha256 "adcec6f2e6fdb034b7ce8eb6bee798c5353327c09e83f511e2dd3d4b68c40867"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2488.0.0-darwin-arm64.tar.gz"
      sha256 "cc18a8caa2eb66ae1505281f3bdadbcda98768af536c9c290c43908cfd06f595"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2488.0.0-linux-x64.tar.gz"
    sha256 "cbef8d01aba51adcf26d7ec782940a31956671f8a9c74918bc8b136548499b7a"
  end
  version "2488.0.0"
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
