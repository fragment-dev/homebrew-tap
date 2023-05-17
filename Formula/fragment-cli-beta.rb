require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2683.0.0-darwin-x64.tar.gz"
    sha256 "1c87c6364ff7c146e74307e0e0153be3335c55b24f1d1c4270267b613530464d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2683.0.0-darwin-arm64.tar.gz"
      sha256 "6f47fcaffb72294ee3efc77635c6470078fc473a42de34d298e5d296780d24fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2683.0.0-linux-x64.tar.gz"
    sha256 "c86e09df86dbb078e38043eb9bf5281a054368bf850681ee3f2569a5f55214af"
  end
  version "2683.0.0"
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
