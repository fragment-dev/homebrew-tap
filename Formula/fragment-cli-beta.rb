require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5193.0.0-darwin-x64.tar.gz"
    sha256 "afd020e4a1daa48d91f5bcb12d09caa7c74964712f2f2be5d9bcff8799403150"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5193.0.0-darwin-arm64.tar.gz"
      sha256 "9ad9645a28167cb8e6c1eb0cac9a1b73c5da1eaf6e07b578f1ff50c373c65cb6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5193.0.0-linux-x64.tar.gz"
    sha256 "c2836152d889f58a551278901167a91b6525443870ffda0581fe5edb852d0344"
  end
  version "5193.0.0"
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
