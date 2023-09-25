require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3656.0.0-darwin-x64.tar.gz"
    sha256 "16c36a32ad269803bd09db5cf4dea82491ae5021bd8fb0feb95f358f8fdc9e4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3656.0.0-darwin-arm64.tar.gz"
      sha256 "dd0f1dd71e02c3cd7ba63c74bc08d4da9c187df59b66cced024862b8989cae28"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3656.0.0-linux-x64.tar.gz"
    sha256 "e4e282db76fc4137c6733ddd4340f9dc3f477d681ace1abfdff6b1616d139710"
  end
  version "3656.0.0"
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
