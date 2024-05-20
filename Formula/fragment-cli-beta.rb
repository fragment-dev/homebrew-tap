require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5091.0.0-darwin-x64.tar.gz"
    sha256 "1ffec1e840829cc7757498ed6553a78b8d1bd82753d9b778ed0f9895ac788253"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5091.0.0-darwin-arm64.tar.gz"
      sha256 "8fd02f9c7728d190a9c74482f26c79d16809b460621182293a3a0b24385268a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5091.0.0-linux-x64.tar.gz"
    sha256 "ae608889f0ecf59dd91d7079405a0843d32f2ca60988fec0909543f0e0aefa1b"
  end
  version "5091.0.0"
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
