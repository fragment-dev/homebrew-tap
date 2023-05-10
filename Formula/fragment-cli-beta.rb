require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2619.0.0-darwin-x64.tar.gz"
    sha256 "a157699a34f16856763e0819b232429fc5f6e06c78bad456119dfcdbe5c6b5a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2619.0.0-darwin-arm64.tar.gz"
      sha256 "e665afd4efadb7c747a90fb100a1024477a10f9cd656db6090f3523e73d335e6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2619.0.0-linux-x64.tar.gz"
    sha256 "1c236fadbaee2ccc0f412dbbf047d4d372cbce7ac7128440d779d07f7e816a82"
  end
  version "2619.0.0"
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
