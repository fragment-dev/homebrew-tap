require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4138.0.0-darwin-x64.tar.gz"
    sha256 "10e77a1ed90d6c4e8e795f22916877aece87d11f29b06e33892d9342601fbbb3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4138.0.0-darwin-arm64.tar.gz"
      sha256 "6d64de7d4b26d72d62906b2009c2ac12e5c77a77b1ce3122063b7171eb358949"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4138.0.0-linux-x64.tar.gz"
    sha256 "76f29982018a3c99031ba8477f97b2fb97ddf17aced2481124ec7cabbb870e04"
  end
  version "4138.0.0"
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
