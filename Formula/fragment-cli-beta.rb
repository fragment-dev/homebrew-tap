require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4686.0.0-darwin-x64.tar.gz"
    sha256 "abe0f1c24187ea78b5f688366fe5d20b42cb91e92298588ccf015dec607b7543"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4686.0.0-darwin-arm64.tar.gz"
      sha256 "eb1d39c7569f169848a9f67f3a315b78abc37cc8d6b3cda9cc578b5226445cb2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4686.0.0-linux-x64.tar.gz"
    sha256 "2163c6fb82527a58b2777a198fbffb4bc2fe83f2e7ce181a81c23b1e76ae7904"
  end
  version "4686.0.0"
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
