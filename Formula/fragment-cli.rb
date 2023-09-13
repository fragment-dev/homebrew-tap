require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-darwin-x64.tar.gz"
    sha256 "1941e8d1e8da63acd620b4579739e3ef10ab8dd7d6eb94ac63274f18448a3697"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-darwin-arm64.tar.gz"
      sha256 "f3dc77dd542403b830ddf0308a1b4815029534a77099b7108a923c9d5401a9b1"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-linux-x64.tar.gz"
    sha256 "b1c1414a1f2372de7970f6653f11543391830370cc4471261ffad6fde6bf9b37"
  end
  version "2023.9.13"
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
