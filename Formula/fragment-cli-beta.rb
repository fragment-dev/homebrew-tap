require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4279.0.0-darwin-x64.tar.gz"
    sha256 "12cb45abd474119e2ce412396e8babd22d64210f9f7acf82f72e57c0dbdfa105"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4279.0.0-darwin-arm64.tar.gz"
      sha256 "7415dbe75bc89e36052e47a92e297c24536a3b52126df9251de9daab2f8a3ae4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4279.0.0-linux-x64.tar.gz"
    sha256 "a5a4d64b79a23c4db279307ed8121a40de20377d11278a6b6bc9f4f004a70d2b"
  end
  version "4279.0.0"
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
