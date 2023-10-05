require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3770.0.0-darwin-x64.tar.gz"
    sha256 "8aebb8a1e6d8177dc0a000d3c8ccbacde7a30c51083f5a2026a74930fcb8e29e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3770.0.0-darwin-arm64.tar.gz"
      sha256 "2fb424fac51d3097055d63fe6cf638d8e99c3704755b4966dd7bef4350b88714"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3770.0.0-linux-x64.tar.gz"
    sha256 "2b4a26db041e2262f97c848a61e5c723d8fe2ef4f8e0c612d34b131a4db8d24d"
  end
  version "3770.0.0"
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
