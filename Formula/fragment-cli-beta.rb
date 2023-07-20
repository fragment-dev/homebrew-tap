require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3140.0.0-darwin-x64.tar.gz"
    sha256 "bd9c0a71bc8792a6befbc5837ca038a72950c2221513e7b99fe8a98bede6b767"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3140.0.0-darwin-arm64.tar.gz"
      sha256 "66ee69d0ce42e901c41f18e8b487a9986e7cae60242187892eaedfc58ee96572"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3140.0.0-linux-x64.tar.gz"
    sha256 "9990bcbb14469154580d5925a3dc97e03ab9e3896d5da2c3b00a45a5d022f91e"
  end
  version "3140.0.0"
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
