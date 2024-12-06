require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5859.0.0-darwin-x64.tar.gz"
    sha256 "ef8ed137840329489d9deef7209b88e25bf2446cf593ec19af7a5c61132e6eac"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5859.0.0-darwin-arm64.tar.gz"
      sha256 "940c1c30c1d68f51a34d6d9c67c255192e07a6bce3ea5584896bfa06abbf9673"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5859.0.0-linux-x64.tar.gz"
    sha256 "9bbafc81b4e8883ae2ee63b6fe473284505e42cf03d1b93cff560dfbec315014"
  end
  version "5859.0.0"
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
