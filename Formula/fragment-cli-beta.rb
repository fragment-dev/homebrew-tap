require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4190.0.0-darwin-x64.tar.gz"
    sha256 "08601e96cbe23e78523840d10f4f399852a78ef05eb425855aaf310c4bd6230a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4190.0.0-darwin-arm64.tar.gz"
      sha256 "986d8861b67f497cba585921b82a64214e8fecf662d398a86fad49c1997b63c7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4190.0.0-linux-x64.tar.gz"
    sha256 "1bfff72a87e3a2dc490a568f9389345549220d479d7d16af984427953a83f40e"
  end
  version "4190.0.0"
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
