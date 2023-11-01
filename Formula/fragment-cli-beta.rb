require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-darwin-x64.tar.gz"
    sha256 "efc174992e7322cafff160fbd6ff502d81d2daec727054cd6f1ad25afabe046e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-darwin-arm64.tar.gz"
      sha256 "089fe7a1df6e65ea6aa2f640a241d3ed419bb296430c4e20189d894bc38d4998"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.0.0-linux-x64.tar.gz"
    sha256 "f34589e6b6aedf50912b16aaacd47132458631fac77925b66fb82c72ba5be917"
  end
  version "3955.0.0"
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
