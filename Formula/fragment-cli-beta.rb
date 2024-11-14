require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5768.0.0-darwin-x64.tar.gz"
    sha256 "24a1eaab8b65dc42f3b77a24329b685f251f4595d1d6bb3ecc1b680671631367"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5768.0.0-darwin-arm64.tar.gz"
      sha256 "67c3a83ef6c0dd7558bf500e4051d3d70e8d0ca01c481ea72a2647d9578419e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5768.0.0-linux-x64.tar.gz"
    sha256 "2594a814ddc273f42717ab68a94bf38e325bfb2f75945a57271cc63bb07ce22e"
  end
  version "5768.0.0"
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
