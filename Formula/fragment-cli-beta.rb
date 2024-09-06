require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5570.0.0-darwin-x64.tar.gz"
    sha256 "e038499d68195cb188db9688d10c8c102d65ebb37299169743806ffee5f3d970"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5570.0.0-darwin-arm64.tar.gz"
      sha256 "f7786985e4441bc484d3e2551e968ee550f91b129b4238157f32b8238b80af11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5570.0.0-linux-x64.tar.gz"
    sha256 "330e70926c5652ccb21ad3bf8bd0e41ab84a8ac1d49fffd892bd844f35465d57"
  end
  version "5570.0.0"
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
