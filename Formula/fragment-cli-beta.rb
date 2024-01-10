require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4304.0.0-darwin-x64.tar.gz"
    sha256 "c529d0475e1039cb93054f60ac0dafa648ed3863940fd0e8e59926e1a73ef4ec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4304.0.0-darwin-arm64.tar.gz"
      sha256 "d357a44de7132b17ff8de0b260f8be3bec5c4fedcf1cddc1edfb7943dc90fb38"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4304.0.0-linux-x64.tar.gz"
    sha256 "aaf40e050ce707cd8b18e475306476491590e8bcd25a38a88425370545e42220"
  end
  version "4304.0.0"
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
