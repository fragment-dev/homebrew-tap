require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3127.0.0-darwin-x64.tar.gz"
    sha256 "9f7f18e80e8926e8e485899689311369abad7bc01790f83259ce6f07f67828c1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3127.0.0-darwin-arm64.tar.gz"
      sha256 "f46099a1a0ff4c0643ecc04ebcfaf409ff62b3d35dec22aff9b379e7bbb97615"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3127.0.0-linux-x64.tar.gz"
    sha256 "da52d866bb2bc82a6b5a8cc83070a815d6cbd478e02acc63fcd1dbadd918bf22"
  end
  version "3127.0.0"
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
