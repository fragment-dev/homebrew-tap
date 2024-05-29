require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5137.0.0-darwin-x64.tar.gz"
    sha256 "debdff8575d16d4cfaaeff09621f16f51ded0bf7352ab25b9f1f2e58220035ac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5137.0.0-darwin-arm64.tar.gz"
      sha256 "d10f51fd7c25e8c48a9fbcebfed31fd54f4f2eaedcfeee493e43a606fbc39052"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5137.0.0-linux-x64.tar.gz"
    sha256 "6f94cc9f09e8d4b2ec68402ebe8cda22e024bf722ddda208de0be9d35027b6de"
  end
  version "5137.0.0"
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
