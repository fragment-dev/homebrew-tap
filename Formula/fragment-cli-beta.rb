require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4459.0.0-darwin-x64.tar.gz"
    sha256 "77a36a8155f0961afb350cbbfdc6075152b5fea4ab1536b9d33c599a3e220750"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4459.0.0-darwin-arm64.tar.gz"
      sha256 "ed371cf4f3b61210c0f0bec88cfe69abc711e444694af39bd659038830220550"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4459.0.0-linux-x64.tar.gz"
    sha256 "22de6a11f04b1a5df4be7018fdc371a6f87694daa50b39b53dfcee41d4315d80"
  end
  version "4459.0.0"
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
