require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3655.0.0-darwin-x64.tar.gz"
    sha256 "8eb0345e91c94790f320c50e6c30824a2bdd46074fcd6f9a06da2e2afc199779"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3655.0.0-darwin-arm64.tar.gz"
      sha256 "1c960234cb0faa04793f2d387ecb993aa42ed6a14ee68dc6e2f1a6c647c44311"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3655.0.0-linux-x64.tar.gz"
    sha256 "a88ff47235821413a9f88d7a2345ea2940635fefbf91b5d87cf61c8c2335b0de"
  end
  version "3655.0.0"
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
