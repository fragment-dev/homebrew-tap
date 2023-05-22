require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2714.0.0-darwin-x64.tar.gz"
    sha256 "6b70e5e18766ff75388113370a018694d2de63d8ecdf03c87aa9546bff76c820"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2714.0.0-darwin-arm64.tar.gz"
      sha256 "c6cf430217a68478213588cfeb6b7c6e89eab8a9ecaa16cd54e60796e4f31622"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2714.0.0-linux-x64.tar.gz"
    sha256 "598101cb941f9e8813dfa1ec2069b29b5c4d6ab656fd5e3a2652c39890c60132"
  end
  version "2714.0.0"
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
