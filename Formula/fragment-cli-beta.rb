require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3324.0.0-darwin-x64.tar.gz"
    sha256 "676ce2184f7530d4d0f67caa6ee6368f67fbc27ecd702e70ca2d7d4a2cff5569"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3324.0.0-darwin-arm64.tar.gz"
      sha256 "23111b09d82266321f51ac7e3cf20c37310f498e11147ba2d21a64f3f51b80d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3324.0.0-linux-x64.tar.gz"
    sha256 "860c50aa827d2b695446f664fc715813e56bbf993bf4542570e3d69bbb15364e"
  end
  version "3324.0.0"
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
