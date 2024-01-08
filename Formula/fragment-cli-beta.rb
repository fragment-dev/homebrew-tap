require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4289.0.0-darwin-x64.tar.gz"
    sha256 "00a3950c2543a0bbfc4d49c554f42deefe74ac89cc38585d2c608a7508a5cb10"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4289.0.0-darwin-arm64.tar.gz"
      sha256 "1da827cb15346d23599532c856f1be347cfe0e94e797143560aae05d7370cf23"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4289.0.0-linux-x64.tar.gz"
    sha256 "c7189e7b0405c16b120fab2093bc634b3ce128efc71a3a8d7721c2397aec0b1c"
  end
  version "4289.0.0"
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
