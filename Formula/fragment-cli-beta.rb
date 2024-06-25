require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-x64.tar.gz"
    sha256 "0f66aeedb4c65ff5568c1edd801dc692739c84ffc295e0026506b67792bb9121"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "127f818cd862005a91cfe497344f3fc253400d433172dd743f57460a90aad777"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-linux-x64.tar.gz"
    sha256 "9bfaa888108fe84263430eb35e2edecd323a953bf082b5999ae196e1ea4900cc"
  end
  version "1.0.0"
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
