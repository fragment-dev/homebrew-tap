require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3153.0.0-darwin-x64.tar.gz"
    sha256 "f059cc557a4421a9c28b2c105f0c6fed7fc5401b5f09b093292840e3cd3ccb27"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3153.0.0-darwin-arm64.tar.gz"
      sha256 "03eb39fccc91533a06f5ff604fcd83fd3d75044c4e6960a86c728f2fbd2783f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3153.0.0-linux-x64.tar.gz"
    sha256 "bb0c9a069e11ef153b6031eec3c6c81afafefd3b365e397c4ca07f1d6fe79b8f"
  end
  version "3153.0.0"
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
