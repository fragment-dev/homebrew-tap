require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3462.0.0-darwin-x64.tar.gz"
    sha256 "e006e05ce376fd05d540f79eb79a643b5e4d3f47c85ed797da5d43729ce27798"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3462.0.0-darwin-arm64.tar.gz"
      sha256 "9f2114fd0f58d03362f43bf5396abb07c93eb42980e95738678408923f2a1c35"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3462.0.0-linux-x64.tar.gz"
    sha256 "d25e667e55c16a6e92792f0677c2581229d13ac7013c145e3c20c0595925977c"
  end
  version "3462.0.0"
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
