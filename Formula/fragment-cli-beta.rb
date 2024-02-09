require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4532.0.0-darwin-x64.tar.gz"
    sha256 "c720bbce49ec2d157c55ec33fbcbc19b17015b284168d01c35e1bf3342cfee4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4532.0.0-darwin-arm64.tar.gz"
      sha256 "b68cc0d9ad7adf3bda17146bf065ddbbf66fdac3dbbe250e9a91692d53e1f8b8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4532.0.0-linux-x64.tar.gz"
    sha256 "3b454e0b57a82e424b933f3b0b8ef1abbf7d3f330cedc677bceea11cde1732ec"
  end
  version "4532.0.0"
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
