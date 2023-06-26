require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2930.0.0-darwin-x64.tar.gz"
    sha256 "e0db5621a263e4db0ceaa1d81e04a4ffea732ca7e5b998ac7abdf9013cca9fbf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2930.0.0-darwin-arm64.tar.gz"
      sha256 "113666a587c1ffa900afff82226b6d428ac262a0f0d0038f44157f2ee030c984"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2930.0.0-linux-x64.tar.gz"
    sha256 "90b8c88a8a8e17ac12dfbd79a5976d04ab265347d22667369202bdf2e09401ae"
  end
  version "2930.0.0"
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
