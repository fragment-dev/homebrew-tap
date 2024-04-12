require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4887.0.0-darwin-x64.tar.gz"
    sha256 "56f90436353c47110a1c2b97f213f527df0b764ddc88bc4a8511703857d97540"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4887.0.0-darwin-arm64.tar.gz"
      sha256 "133969f6dca77b7b6e54a9887ae98023b95d55aac9cee92fcbe5c0a7b065157c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4887.0.0-linux-x64.tar.gz"
    sha256 "dd176c519c32c22fde28634a25ae0e76fefb50af756ac0c909327b6fb9da4722"
  end
  version "4887.0.0"
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
