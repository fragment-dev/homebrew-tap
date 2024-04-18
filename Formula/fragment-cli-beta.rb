require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4920.0.0-darwin-x64.tar.gz"
    sha256 "00984af3bfa86b490b720ec824eb886f4ef253c3d4f41cc438481b3e17fd5cfc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4920.0.0-darwin-arm64.tar.gz"
      sha256 "7860cd5f398d04a500b6d17efaee4e933fd1ee3946ef14c1d7eb3844ef530ae6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4920.0.0-linux-x64.tar.gz"
    sha256 "962d2824e6f54ca2fec9fc8735477e8b792149d521f3bfd5fa727e521c0bafde"
  end
  version "4920.0.0"
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
