require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.17-darwin-x64.tar.gz"
    sha256 "2f8f597b6c682f653d6902e4db2d461397492b63e0c0a84e93f7732a6531b924"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.17-darwin-arm64.tar.gz"
      sha256 "9d8e1557bf5b8bfee391ca1fe856db51e55c43ba28c928c67da6c505ddb42d7c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.17-linux-x64.tar.gz"
    sha256 "73b79abec3f184ae7372a7ed690027594d79c7b5bfc9f91f06f00af4b2ce98a2"
  end
  version "2023.5.17"
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
