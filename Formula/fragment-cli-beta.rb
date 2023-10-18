require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3860.0.0-darwin-x64.tar.gz"
    sha256 "957dd0abdc4643fdcf546f69217ecf21ad22415185dee83663058dbde7fa0069"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3860.0.0-darwin-arm64.tar.gz"
      sha256 "50bbe6c5f007d00c195c73944a3ef2b165dc2fab640d737114cec9b6df545176"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3860.0.0-linux-x64.tar.gz"
    sha256 "beface880a975c97b5b1223e3217942434ea72ed5b06c9b893921383823655e3"
  end
  version "3860.0.0"
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
