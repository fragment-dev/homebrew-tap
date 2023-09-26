require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3670.0.0-darwin-x64.tar.gz"
    sha256 "13dbda2bc5e7f5184a487e1017bca639137aff688c387f49e69807e781869c82"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3670.0.0-darwin-arm64.tar.gz"
      sha256 "bd9fb50d7e3af4a7939ef49944f8e1a4aa858825b32bbabca62ffbb5a05c7b9c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3670.0.0-linux-x64.tar.gz"
    sha256 "291e61c3587982dc62c20a6d035f0044b50fc9747f6cfbbb96cb93142a5fdea6"
  end
  version "3670.0.0"
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
