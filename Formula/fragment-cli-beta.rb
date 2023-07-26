require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-darwin-x64.tar.gz"
    sha256 "8aa4d646a6f5f332e3d5c8e144a99b8a00224041ceeb91731e7be5dc333e067a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-darwin-arm64.tar.gz"
      sha256 "a3203c4104795b0bdf9bdcfd6568ed6181102400beeb6ed169f9b03d3404ca5c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3167.0.0-linux-x64.tar.gz"
    sha256 "b38bb024520d32f89a07c080096d31ac12f55a010401bfe77d579e9607eb4084"
  end
  version "3167.0.0"
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
