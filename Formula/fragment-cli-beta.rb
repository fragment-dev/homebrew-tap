require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2697.0.0-darwin-x64.tar.gz"
    sha256 "2c4de4ba1598dde45db486cf7c8a39602ffd81195b5d611b0a4fcc5b2d6c402f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2697.0.0-darwin-arm64.tar.gz"
      sha256 "d3acd03835389e42ba848c8ff5fcd7614c4d792fb05e573f321ab695d2ea6648"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2697.0.0-linux-x64.tar.gz"
    sha256 "f56fd5d46c70dd87a725462056eaad5ea630225fd0c8747e495c03197ba09a98"
  end
  version "2697.0.0"
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
