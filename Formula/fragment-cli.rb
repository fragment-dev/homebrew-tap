require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-darwin-x64.tar.gz"
    sha256 "56499afd8bff30342ee1b68d2fedf5115af55c24d9d05c8ccc7a75cc67de322a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-darwin-arm64.tar.gz"
      sha256 "2e64f2edb75fe73d6520fa94544f61500d2595b875c511a6d20202e4af0aca53"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.15-linux-x64.tar.gz"
    sha256 "a74cd5363b1a5338769599c2bc83f3d708d488a4bbdc946121e874578a594da5"
  end
  version "2023.6.15"
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
