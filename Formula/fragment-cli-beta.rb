require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2844.0.0-darwin-x64.tar.gz"
    sha256 "1e39fef35612be6b9cedf61c25510336030e038912b5996aa83b515d33960609"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2844.0.0-darwin-arm64.tar.gz"
      sha256 "320a4c059e7fb9235a0362427718e6dcd9aae5032c7f10409441a1545361c2a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2844.0.0-linux-x64.tar.gz"
    sha256 "2317d96acf66ad3094dea58a46da667fd54594227cec5a1ea00d9e336abde7a4"
  end
  version "2844.0.0"
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
