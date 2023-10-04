require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3765.0.0-darwin-x64.tar.gz"
    sha256 "52ac03f20f64dbaebd9266e7da514230280b8d40b9558d9a88b0ab0230b4fd34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3765.0.0-darwin-arm64.tar.gz"
      sha256 "693cf3f071da61f4418d9b55f0588b14e34867aae1ceda7557df5d5240461d25"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3765.0.0-linux-x64.tar.gz"
    sha256 "01ac8f72b040fa1afa01ec2e83b7bbdac41db3695d2114f1d492b36ab63746cd"
  end
  version "3765.0.0"
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
